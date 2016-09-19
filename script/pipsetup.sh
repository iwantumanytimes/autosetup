#check if the supervisor has been setup
installpip()
{
    echo '...you will  steup  python pip...'
    pipversiondefault=1.5.5
    yum install python-setuptools
    wget --no-check-certificate https://github.com/pypa/pip/archive/$pipversiondefault.tar.gz
    tar zvxf $pipversiondefault.tar.gz    
    cd pip-$pipversiondefault/
    python setup.py install
}
installsupervisor()
{
    echo  "installing ...."
    echo '...You will  steup  supervisor...'
    file="supervisor.conf"
    cd /etc
    if [  -f "$file" ]; then
        echo "supervisor has been  setup,exiting..."
        exit
    else
        pip install supervisor
        echo_supervisord_conf >/etc/supervisor.conf
    fi
}
installpip
installsupervisor


 
