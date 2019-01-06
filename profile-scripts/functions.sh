function getnextversion ()
{
 local currentversion=$1
 local bumper=$2

 if [ "$currentversion" = "" ]; then
    echo "1.0.0" 
 fi

 if [ "$bumper" = "" ]; then
    echo $currentversion
 elif [ "$bumper" = "+fx" ]; then
    echo $(semver bump patch $currentversion)
 elif [ "$bumper" = "+mi" ]; then
    echo $(semver bump minor $currentversion)
 elif [ "$bumper" = "+ma" ]; then
    echo $(semver bump major $currentversion)
 else
    echo "1.0.0"
 fi
}

function cleanup_fedora_kernel ()
{
dnf install yum-utils
package-cleanup --oldkernels --count=2
}

function check_fedora_installhistory ()
{
 sudo dnf history userinstalled
 dnf repoquery -qf "%{name}" --userinstalled 
}

function check_fedora_kernels ()
{
 rpm -q kernels
}


