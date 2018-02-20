<#
        removeDefault10Apps.ps1
        Description : removes the default 10 apps that nobody uses
        Author : Sean McElhare
        Date Created : 11/16/2017
        Date Last Modified : 11/28/2017
        NOTES : Modify "defaultApps" array to add or subtract apps, if adding remember to use the template and make sure the last item does not have a "," at the end
                To get a full list of the current apps installed run "Get-AppxPackage -AllUsers | Select Name, PackageFullName", Microsoft.3DBuilder translates into "*3dbuilder*". NOT ALL APPS CAN BE REMOVED!
                Script may need to be run as Administrator!
                
#>
Set-ExecutionPolicy ByPass

<# Template for copy and paste "**", #>

$defaultApps = @("*3dbuilder*",
                 "*windowsalarms*",
                 "*windowscamera*",
                 "*getstarted*",
                 "*zunemusic*",
                 "*windowsmaps*",
                 "*solitairecollection*",
                 "*bingfinance*",
                 "*zunevideo*",
                 "*bingnews*",
                 "*windowsphone*",
                 "*people*",
                 "*bingsports*",
                 "*xboxapp*"
                 "*Messaging*",
                 "*XboxIdentityProvider*",
                 "*WindowsFeedbackHub*",
                 "*skypeapp*",
                 "*contactsupport*",
                 "*Advertising*",
                 "*Wallet*",
                 "*Microsoft3DViewer*",
                 "*HolographicFirstRun*",
                 "*Print3D*");

foreach($app in $defaultApps)
{
   $removeCMD = "Get-AppxPackage $app | Remove-AppxPackage";

   try
   {
        iex($removeCMD);
   }
   catch
   {
        echo($app + " could not be removed!");
   }

}
echo("Removal Complete!");