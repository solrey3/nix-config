
import os
import pandas as pd
import frontmatter
from yt_dlp import YoutubeDL
from mutagen.easyid3 import EasyID3
from mutagen.id3 import ID3, TXXX
import re

def extract_youtube_id(url):
    """Extracts the YouTube video ID from a URL."""
    match = re.search(r'(?:v=|youtu\.be/|youtube\.com/embed/|youtube\.com/watch\?v=)([\w-]{11})', url)
    return match.group(1) if match else None

def read_markdown_files(directory):
    """Reads markdown files from a directory and extracts frontmatter as rows in a DataFrame."""
    rows = []
    for filename in os.listdir(directory):
        if filename.endswith('.md'):
            filepath = os.path.join(directory, filename)
            with open(filepath, 'r', encoding='utf-8') as file:
                post = frontmatter.load(file)
                rows.append(post.metadata)
    return pd.DataFrame(rows)

def download_youtube_audio(url, output_path, metadata):
    """Downloads YouTube audio and saves it with the specified metadata."""
    ydl_opts = {
        'format': 'bestaudio/best',
        'postprocessors': [{
            'key': 'FFmpegExtractAudio',
            'preferredcodec': 'mp3',
            'preferredquality': '320',
        }],
        'outtmpl': os.path.join(output_path, '%(title)s.%(ext)s'),
    }

    with YoutubeDL(ydl_opts) as ydl:
        info_dict = ydl.extract_info(url, download=True)
        downloaded_file = ydl.prepare_filename(info_dict).replace('.webm', '.mp3').replace('.m4a', '.mp3')

    # Rename the file using artist and title
    artist = metadata.get('artist', 'Unknown Artist')
    title = metadata.get('title', 'Unknown Title')
    new_filename = f"{artist} - {title}.mp3"
    new_filepath = os.path.join(output_path, new_filename)
    os.rename(downloaded_file, new_filepath)

    # Add ID3 tags
    audio = EasyID3(new_filepath)
    audio['artist'] = artist
    audio['title'] = title
    audio['album'] = metadata.get('album', '')
    audio['label'] = metadata.get('label', [''])[0]
    audio['genre'] = metadata.get('genre', '')

    # Add custom ID3 tags
    audio.save()
    audio = ID3(new_filepath)
    audio.add(TXXX(encoding=3, desc='discoverysource', text=metadata.get('discoverysource', '')))
    audio.add(TXXX(encoding=3, desc='youtubeurl', text=url))
    youtube_id = extract_youtube_id(url)
    if youtube_id:
        audio.add(TXXX(encoding=3, desc='youtubeid', text=youtube_id))
    audio.save()

    return new_filepath

def main():
    input_dir = './markdown_files'  # Replace with your directory containing markdown files
    output_dir = './downloads'  # Replace with your desired download directory
    os.makedirs(output_dir, exist_ok=True)

    # Read markdown files and create a DataFrame
    df = read_markdown_files(input_dir)

    # Process rows with a 'youtubeurl'
    for _, row in df.iterrows():
        youtube_url = row.get('youtubeurl')
        if youtube_url:
            print(f"Downloading: {row.get('artist', 'Unknown Artist')} - {row.get('title', 'Unknown Title')}")
            download_youtube_audio(youtube_url, output_dir, row)

if __name__ == '__main__':
    main()
