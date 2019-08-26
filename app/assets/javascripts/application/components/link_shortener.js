function copyToClipBoard() {
  var copyText = document.getElementById("shortenedUrl");

  copyText.select();

  document.execCommand("copy");

  alert("Url copied to clipboard: " + copyText.value);
} 