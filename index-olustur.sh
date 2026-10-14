#!/bin/sh
# portfolyo.html (artifact kaynağı) -> index.html (GitHub Pages için tam sayfa)
# portfolyo.html'nin başındaki <title> ve description satırları burada <head>'e taşınır.
cd "$(dirname "$0")" || exit 1
URL="https://cafu1107.github.io/"
DESC="Cafu's projects as game cartridges in a cartoon treehouse. Pick one and Piko, a little handheld console, plugs it in."
{
  cat <<HEAD
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">
<title>Cafu's Room</title>
<meta name="description" content="$DESC">
<meta name="theme-color" content="#3a2416">
<link rel="icon" href="favicon.svg" type="image/svg+xml">
<link rel="canonical" href="$URL">
<meta property="og:type" content="website">
<meta property="og:url" content="$URL">
<meta property="og:title" content="Cafu's Room">
<meta property="og:description" content="$DESC">
<meta property="og:image" content="${URL}og.jpg">
<meta property="og:image:width" content="1200">
<meta property="og:image:height" content="630">
<meta name="twitter:card" content="summary_large_image">
</head>
<body>
HEAD
  sed -e '/^<title>/d' -e '/^<meta name="description"/d' portfolyo.html
  printf '\n</body>\n</html>\n'
} > index.html
echo "index.html yazildi"
