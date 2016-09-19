#check if the supervisor has been setup
model_superviosr_config_add=https://raw.githubusercontent.com/iwantumanytimes/autosetup/master/config/svc/supervisor.conf
svc_supervisor_ini_config=https://raw.githubusercontent.com/iwantumanytimes/autosetup/master/config/svc/svc.ini
installpip()
{
    echo '...You will  steup  python pip...'
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
    echo  '...You will  steup  supervisor...'
    file="supervisor.conf"
    cd /etc
    if [  -f "$file" ]; then
        echo "...supervisor has been  setup,exiting..."
        exit
    else
        pip install supervisor
        cd  /etc
        wget model_superviosr_config_add
    
        cd /root
        mkdir  italk_svc_process_config
        cd     italk_svc_process_config
        wget svc_supervisor_ini_config
        echo "...starting supervisord service..."
    
        supervisord  -c  /etc/supervisor.conf
    fi
}
installpip
installsupervisor


 
