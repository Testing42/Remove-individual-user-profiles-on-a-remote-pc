$Computers = @("pc1","pc2","pc3","pc4")

$fileExists = Test-Path -Path $PSScriptRoot\OFFLINE.txt -PathType Leaf

 

    if($fileExists = "True"){

        Clear-Content $PSScriptRoot\OFFLINE.txt -Force -ErrorAction SilentlyContinue

    }

   

 

    forEach ($comp in $Computers) {

       if (Test-Connection -ComputerName $comp -Count 1 -Quiet -ErrorAction SilentlyContinue) {

     

       }

       else {

          $comp | Out-File -FilePath $PSScriptRoot\OFFLINE.txt -Append
          #change the file path above to where ever you want.

       }

    }
