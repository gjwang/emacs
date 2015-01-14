function cvsst
{
        cvs st $* 2>&1|grep "Status: "|grep -v "Up-to-date"
}

function svnst
{
    svn st -qu
}

function gitst
{
    git status
}

function jgrep()
{
    find . -name .repo -prune -o -name .git -prune -o  -type f -name "*\.java" -print0 | xargs -0 grep --color -n "$@"
}

function mkgrep()
{
    find . -name .repo -prune -o -name .git -prune -o  -type f -name "*\.mk" -print0 | xargs -0 grep --color -n "$@"
}


function cgrep()
{
    find . -name .repo -prune -o -name .git -prune -o -type f \( -name '*.c' -o -name '*.cc' -o -name '*.cpp' -o -name '*.h' \) -print0 | xargs -0 grep --color -n "$@"
}

export JAVA_HOME=/usr/lib/jvm/jdk1.6.0_45
export JRE_HOME=${JAVA_HOME}/jre
export CLASSPATH=.:${JAVA_HOME}/lib:${JRE_HOME}/lib
export ANT_HOME=/usr/share/ant
export PATH=$PATH:${ANT_HOME}:${JAVA_HOME}/bin

export ANDROID_NDK=/home/android_build/android-ndk-r9d
export PATH=${PATH}:${ANDROID_NDK}
export NDK=$ANDROID_NDK
export PATH=$PATH:$NDK
export PATH=$PATH:${NDK}/toolchains/arm-linux-androideabi-4.8/prebuilt/linux-x86_64/bin/

# Android tools
export PATH=${PATH}:/home/android_build/adt-bundle-linux-x86_64-20140321/sdk/tools
export PATH=${PATH}:/home/android_build/adt-bundle-linux-x86_64-20140321/sdk/platform-tools

