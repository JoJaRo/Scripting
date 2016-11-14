$path = Get-childitem 'C:\Source\Websites\*\web.config'
$Old = 'Steve'
$New = 'Frank'       

foreach ( $config in $path)
    {
        Write-Host '"Looking for "'$Old '"replacing with" ' $new
        $Matches = Select-String -InputObject $config -Pattern $Old -AllMatches
        $Matches.Matches.Count

    }