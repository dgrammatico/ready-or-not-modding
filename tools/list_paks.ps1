# Lists installed mod paks in load order (alphabetical), with size and date.
param([string]$Game = "C:\Program Files (x86)\Steam\steamapps\common\Ready Or Not")
$dir = Join-Path $Game "ReadyOrNot\Content\Paks\~mods"
Get-ChildItem $dir -Include *.pak,*.utoc,*.ucas -Recurse |
  Sort-Object Name |
  Format-Table Name, @{n='MB';e={[math]::Round($_.Length/1MB,1)}}, LastWriteTime -AutoSize
