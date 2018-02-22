#!/bin/sh

unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=Mac;;
    CYGWIN*)    machine=Cygwin;;
    MINGW*)     machine=MinGw;;
    *)          machine="UNKNOWN:${unameOut}"
esac
echo "The script is run on "${machine}" machine"

if [ "${machine}" == 'Mac' ]; then
    MD5_SHELL="md5 -r "
else
    MD5_SHELL="md5sum "
fi

setUp()
{
    rm results.*
}

test_lab1_task()
{
    # execute student's solution
	sh lab1.sh
    # calculate md5 hash of results file
    md5_results=($($MD5_SHELL results.*))
    # remove trailing filename and leave MD5 hashsum only:
    actual=$(echo $md5_results)
    # declare a list of valid md5 hashes
    # declare -a expected=(49713444858274e0dcd3b4f51bb9513d 1920203ec62b675a81d7984fdbe199a1 a644963651fab554cb5605c5b8e110f6 9a787d7a166e53fc8422cd049a2da6df 2123fffa1d2cda5fdee16e1e1606ae44 a4b1a52e0e68f801eb88e2fa75a647e2 2ac7ea95240c2b3c79a444bb04cccc87 5ae9cc1f4e3ceb830e2647c5608c2e97 4adedf859aa5bbb484fa9a03491b70c4 e957402ea82b4626a67c02e9482e6924 02a69d8f85c87c7f85beabf6a0171bef 346f7f43a252a322a5e421f245c6c6fa)
    #
    declare -a expected=(49713444858274e0dcd3b4f51bb9513d 711dd6705a7f353e72afef285602ff26 72246e71e555278bbb8f59f906311489 1a4a56c3fc811db5bdb9e9800cbb248f 2123fffa1d2cda5fdee16e1e1606ae44 164d812706c8a9c58f3e6da286f8f969 19da0ab6cf0a59621665be57441476c4 bf5aacd06b095c7b83669ff46dce9e0a 4d62056e41c586bf8e6b85d2fb13de91 e957402ea82b4626a67c02e9482e6924 86fc69b15d4dd0d3b1f6bd6cc1a2449c c949e8a9b41cb08de3fdc3842cbb7541)
    for i in {0..11}
    do
        nvar=$(($i+1))
        if [ $actual == ${expected[$i]} ]; then
            echo "Solution for task "$nvar" was found and it seems to be correct."
            assertTrue ${SHUNIT_TRUE}
            return
        fi
    done
    # report failure
    fail "No correct solutions were found."
}

# load shunit2
. shunit2-2.1.6/src/shunit2