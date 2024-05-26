# Function to display a console-based loading bar
function Show-LoadingBar {
    param (
        [int]$duration = 5,
        [int]$totalWidth = 30
    )
    
    $stepDuration = $duration / $totalWidth
    Write-Host -NoNewline "Loading: ["

    for ($i = 0; $i -lt $totalWidth; $i++) {
        Start-Sleep -Milliseconds ($stepDuration * 1000)
        Write-Host -NoNewline "=" -ForegroundColor Cyan
    }

    Write-Host "] Done!" -ForegroundColor Green
}

# Function to print colored text
function Write-ColoredText {
    param([string]$text)
    $colors = [System.ConsoleColor]::Green, [System.ConsoleColor]::Yellow, [System.ConsoleColor]::Blue,
              [System.ConsoleColor]::Red, [System.ConsoleColor]::Cyan, [System.ConsoleColor]::Magenta,
              [System.ConsoleColor]::Gray, [System.ConsoleColor]::White
    $charArray = $text.ToCharArray()
    $colorIndex = 0

    foreach ($char in $charArray) {
        $currentColor = $colors[$colorIndex % $colors.Length]
        Write-Host $char -NoNewline -ForegroundColor $currentColor
        $colorIndex++
    }
    Write-Host # Move to next line
}

# Display the loading bar
Show-LoadingBar

# Display "Hello World" with each letter in a different color
Write-ColoredText "Hello World"
