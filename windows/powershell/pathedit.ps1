# pathedit.ps1 - A Windows PATH Variable Editor
#
# From: <http://github.com/jsalonen>
#

# Load the Winforms assembly
[reflection.assembly]::LoadWithPartialName("System.Windows.Forms")

# Calculate window size from monitor
$desktops = Get-WmiObject -Class Win32_DesktopMonitor 
$maxWidth = [int]640
$maxHeight = [int]480
foreach ($desktop in $desktops) { 
    if( $desktop.ScreenWidth -gt $maxWidth ) {
        $maxWidth = $desktop.ScreenWidth;
    }
    if( $desktop.ScreenHeight -gt $maxHeight ) {
        $maxHeight = $desktop.ScreenHeight;
    }
} 
$windowWidth = $maxWidth/2
$windowHeight = $maxHeight*4/7

# Create the form
$machinePath = [Environment]::GetEnvironmentVariable("PATH", [System.EnvironmentVariableTarget]::Machine)
$userPath = [Environment]::GetEnvironmentVariable("PATH", [System.EnvironmentVariableTarget]::User)
#"Machine PATH: " + $machinePath
#"User PATH: " + $userPath

# Get PATH and split it
$pathItems = [regex]::split($userPath, ";")
$pathItemTextboxes = @()

$form = New-Object Windows.Forms.Form
$form.Size = New-Object Drawing.Point $windowWidth, $windowHeight

# Set the dialog title
$form.text = "PathEdit"

# Create font
$font = new-object System.Drawing.Font "Consolas", 10

# Create the label control and set text, size and location
$label = New-Object Windows.Forms.Label
$label.Location = New-Object Drawing.Point 8,8
$label.Size = New-Object Drawing.Point $windowWidth,15
$label.text = "User PATH (username: "+[Environment]::UserName+")"
$label.font = $font

# Print textfield for each item
$y = [int]32
$i = 0;
$pathItems += ''
Foreach ($pathitem in $pathItems)
{
    $textfield = New-Object Windows.Forms.TextBox
    $textfield.Font = $font    
    $textfield.Location = New-Object Drawing.Point 8, $y
    $textfield.Size = New-Object Drawing.Point ($windowWidth-28),30
    $textfield.text = $pathitem
    $pathItemTextboxes += $textfield;
    $form.controls.add($textfield)

    $y += 26
    $i++;
}

# Create Button and set text and location
$button = New-Object Windows.Forms.Button
$button.font = $font
$button.text = "Save"
$button.Location = New-Object Drawing.Point 8, $y

# Set up event handler to extarct text from TextBox and display it on the Label.
$button.add_click({

    # Glue together modified path
    $pathFull = ''
    $i = 0;
    Foreach ($pathItem in $pathItems) {
        $s = $pathItemTextboxes[$i].text;

        # Must not be empty
        if( $s.length -gt 0 ) {
            if($i -gt 0) {
                $pathFull += ';';
            }
            $pathFull += $s;
        }
        
        $i++;
    }
    
    # Write to registry
    ### Modify system environment variable ###
    #[Environment]::SetEnvironmentVariable
    #( "Path", $env:Path, [System.EnvironmentVariableTarget]::Machine )

    # Modify user path
    [Environment]::SetEnvironmentVariable( "PATH", $pathFull, [System.EnvironmentVariableTarget]::User )
    #[System.Windows.Forms.MessageBox]::Show("PATH=" + $pathFull)   
    
    # Display popup
    [System.Windows.Forms.MessageBox]::Show("PATH updated!")
})

# Add the controls to the Form
$form.controls.add($button)
$form.controls.add($label)

# Display the dialog
$form.ShowDialog()
