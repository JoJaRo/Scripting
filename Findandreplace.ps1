$path = Get-childitem 'C:\Source\Websites\*\web.config'
$Old = 'Steve'
$New = 'Frank'       

foreach ( $config in $path)
    {
        Write-Host 'Before replacement we are counting'$Old 'and' $new 'in' $config
        $MatchesO = Select-String -InputObject $config -Pattern $Old -AllMatches
        Write-host $Old $MatchesO.Matches.Count
        $MatchesN = Select-String -InputObject $config -Pattern $New -AllMatches
        Write-host $New $MatchesN.Matches.Count


    }

foreach ( $config in $path)
    {
        (Get-Content $config.PSPath) |
            ForEach-Object {
                    $_ -replace $Old, $New 
                } | Set-Content $config.PSPath
        
    }

foreach ( $config in $path)
    {
        Write-Host 'After replacements we are Counting' $Old 'and' $new 'in' $config
        $MatchesO = Select-String -InputObject $config -Pattern $Old -AllMatches
        Write-host $Old $MatchesO.Matches.Count
        $MatchesN = Select-String -InputObject $config -Pattern $New -AllMatches
        Write-host $New $MatchesN.Matches.Count

    }