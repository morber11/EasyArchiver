function Check-Parameter($param) {
    if ($param -eq $null) {
        Write-Host "No parameter provided."
        exit 1
    }
}

function Get-SourceFiles($param) {
    $param = $param.ToLower() 
    if ($param -eq "f" -or $param -eq "firefox") { 
        return "manifest.firefox.json", "index.firefox.js"
    }
    if ($param -eq "g" -or $param -eq "c" -or $param -eq "chrome") { 
        return "manifest.chrome.json", "index.chrome.js"
    }
    Write-Host "Invalid parameter."
    exit 1
}

function Check-FileExists($file) {
    if (!(Test-Path $file)) {
        Write-Host "$file not found."
        exit 1
    }
}

function Create-OutputDirectory() {
    if (!(Test-Path "out")) { 
        New-Item -ItemType Directory -Force -Path "out" 
    } 
}

function Copy-Files($files, $param, $indexFile) {
    foreach ($file in $files) {
        $item = Get-Item $file
        switch (Test-Path $file) {
            $true {
                if ($item.PSIsContainer) {
                    if ($file -eq "media" -and ($param -eq "f" -or $param -eq "firefox")) {
                        Copy-Item -Path "$file\*" -Destination "out\" -Recurse -Force
                    }
                    else {
                        Copy-Item -Path $file -Destination "out\" -Recurse -Force
                    }
                }
                else {
                    Copy-Item -Path $file -Destination "out\$file" -Force
                    if ($file -eq $indexFile) {
                        Rename-Item -Path "out\$file" -NewName "index.js" -Force
                    }
                }
            }
            $false {
                Write-Host "Error: $file not found."
                exit 1
            }
        }
    }
}

function Compress-Output() {
    Compress-Archive -Path .\out\* -DestinationPath .\out\EasyArchiver.zip -Update
}

$param = $args[0]

Check-Parameter $param

Write-Host "Starting build"

$srcFile, $indexFile = Get-SourceFiles $param

Check-FileExists $srcFile
Create-OutputDirectory

Copy-Item -Path $srcFile -Destination "out\manifest.json" -Force

$files = @($indexFile, "package.json", "media")

Copy-Files $files $param $indexFile
Compress-Output

Write-Host "Build complete"