#--------------------------------------------
# Declare Global Variables and Functions here
#--------------------------------------------


#Sample function that provides the location of the script
function Get-ScriptDirectory
{
<#
	.SYNOPSIS
		Get-ScriptDirectory returns the proper location of the script.

	.OUTPUTS
		System.String
	
	.NOTES
		Returns the correct path within a packaged executable.
#>
	[OutputType([string])]
	param ()
	if ($null -ne $hostinvocation)
	{
		Split-Path $hostinvocation.MyCommand.path
	}
	else
	{
		Split-Path $script:MyInvocation.MyCommand.Path
	}
}

#Sample variable that provides the location of the script
[string]$ScriptDirectory = Get-ScriptDirectory

function Validate-IsIPEmptyTrim ([string]$field)
{
	#Check its a valid IP address and doesnt contain white spaces, null and empty are ok.
	#dont forget this is reversed on check condition though. i.e. True is false and false is true!!
	if (($field -eq $null) -or ($field -eq ""))
	{
		return $true
	}
	elseif ([string]::IsNullOrWhiteSpace($field))
	{
		return $false
	}
	else
	{
		return $field -match "\b(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\." +`
		"(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\." +`
		"(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\." +`
		"(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\b"
	}
}

function Validate-IsIPEmptyWhitespace ([string]$field)
{
	#Check its a valid IP address and doesnt contain white spaces, null or is empty.
	#dont forget this is reversed on check condition though. i.e. True is false and false is true!!
	if (($field -eq $null) -or ([string]::IsNullOrWhiteSpace($field)))
	{
		return $false
	}
	else
	{
		return $field -match "\b(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\." +`
		"(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\." +`
		"(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\." +`
		"(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\b"
	}
}

function Validate-VlanId ([string]$field)
{
	if (($field -eq $null) -or ($field -eq ""))
	{
		return $true
	}
	elseif ([string]::IsNullOrWhiteSpace($field))
	{
		return $false
	}
	else
	{
		return $field -match '^[1-9]$|^[1-9][0-9]$|^[1-9][0-9][0-9]$|^[1-3][0-9][0-9][0-9]$|^4[0-9][0-9][0-4]$'
	}
}

function Validate-VlanPriority ([string]$field)
{
	if (($field -eq $null) -or ($field -eq ""))
	{
		return $true
	}
	elseif ([string]::IsNullOrWhiteSpace($field))
	{
		return $false
	}
	else
	{
		return $field -match '^[1-7]$'
	}
}

function Validate-VlanDiffserv ([string]$field)
{
	if (($field -eq $null) -or ($field -eq ""))
	{
		return $true
	}
	elseif ([string]::IsNullOrWhiteSpace($field))
	{
		return $false
	}
	else
	{
		return $field -match '^[0-9]$|^[1-5][0-9]$|^6[0-3]$'
	}
}