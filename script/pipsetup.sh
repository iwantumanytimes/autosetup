echo '...you will  steup  python pip...'
pipversiondefault=1.5.5
yum  install   python-setuptools

wget --no-check-certificate https://github.com/pypa/pip/archive/$pipversiondefault.tar.gz

tar zvxf $pipversiondefault.tar.gz    #解压文件
cd pip-$pipversiondefault/
python setup.py install


echo '...you will  steup  supervisor...'
pip  install  supervisor
echo_supervisord_conf >/etc/supervisor.conf 
