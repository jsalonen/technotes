# Simple PowerShell Script to Rotate Image 90 degrees
# Usage: .\rotate.ps1 [infile] [outfile]
# Example: .\rotate.ps1 image1.jpg image1-rotated.jpg
param($Infile,$Outfile)

$currentDir = (Get-Location -PSProvider FileSystem).ProviderPath
$InfilePath = $currentDir + "\" + $Infile
$OutfilePath = $currentDir + "\" + $Outfile

"From: $InfilePath"
"To: $OutfilePath"

[Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms"); 
$i = new-object System.Drawing.Bitmap($InfilePath); 
$i.rotateflip("Rotate90FlipNone"); 
$i.Save($OutfilePath);

"Done."
