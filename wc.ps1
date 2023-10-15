param(
[Parameter()]
$inputfilename,
[switch]$c,
[switch]$l,
[switch]$w,
[switch]$m
)

$inputtext = ""
if($inputfilename) { $inputtext = Get-Content $inputfilename }
else { $inputtext = Read-Host }

$linectr, $wordctr, $characterctr = 0, 0, 0
foreach($line in $inputtext){
    
    $splitline = -split $line
    $wordctr = $wordctr + $splitline.Length
    $linectr = $linectr + 1
    $characterctr = $characterctr + $line.Length
}


function getLineCount()
{
    Write-Output $linectr
}

function getCharacterCount()
{
    Write-Output $characterctr
}

function getWordCount()
{
    Write-Output $wordctr
}

function getByteCount()
{
    Write-Output (Get-Item $inputfilename).Length
}

if($c){ getByteCount }
if($l){ getLineCount }
if($w){ getWordCount }
if($m){ getCharacterCount }

if(!$l -and !$w -and !$c) 
{
    Write-Host "$(getByteCount) $(getLineCount) $(getWordCount) $(getCharacterCount) $inputfilename"
}

# $inputtext | Measure-Object -Character -Word -Line