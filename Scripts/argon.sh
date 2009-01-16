#!/bin/sh
source Scripts/util.sh

export PATH="${HOME}/sw/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin"
# this affects what BSD mail uses for the Reply-To header:
export REPLYTO="tfogal@sci.utah.edu"

# if something should fail:
em="tfogal@sci.utah.edu"
# warnings and other information:
full_em="tfogal@sci.utah.edu jens@sci.utah.edu"

status="status-argon"
function try
{
    $@
    if test $? -ne 0 ; then
        echo "'$@' failed, bailing .."
        echo "Command: '$@' failed..." >> ${status}
        cat ${status} | mail -s "Argon nightly FAILED" ${em}
        exit 1
    fi
}

echo "Using compiler version:" > ${status}
g++ --version >> ${status}
echo "" >> ${status}

echo "On system:" >> ${status}
uname -a >> ${status}
echo "" >> ${status}

echo "-------------------------------------" >> ${status}

try cd ${HOME}/imagevis3d
rm -f *.tar.gz *.zip warnings
try sh Scripts/nightly.sh
cat warnings >> ${status}
subj=""
if test `file warnings | awk '{print $2}'` = "empty" ; then
    subj="Argon nightly (clean) -- `date`"
else
    subj="Argon nightly (warnings) -- `date`"
fi
if test "$1" != "-q" ; then
    cat ${status} | mail -s "${subj}" ${full_em}
fi
try scp *.zip \
    tfogal@shell.sci.utah.edu:/usr/sci/projects/sciweb/devbuilds/imagevis3d/
