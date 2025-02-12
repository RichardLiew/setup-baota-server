USERNAME='richard'
PASSWORD='Anebit@2019'
PORT='9527'
SAFE_PATH=''
IDC_CODE='ed8484bec'
SSL_DISABLE='yes'

ADMIN_PATH='/www/server/panel/data'
ADMIN_AUTH='admin_path.pl'
PANEL_URL='https://download.bt.cn/install/install_panel.sh'

# 如果 SAFE_PATH='/‘，系统会默认重制为'/login'，所以，想要去除安全入口，可以直接删除那个 ADMIN_AUTH 文件
mkdir -p ${ADMIN_PATH}
if [ -z "${SAFE_PATH}" ]; then
    SAFE_PATH='/'
fi
echo "${SAFE_PATH}" > ${ADMIN_PATH}/${ADMIN_AUTH}

curl -sSO ${PANEL_URL}

bash $(basename ${PANEL_URL}) \
    ${IDC_CODE} \
    —user=${USERNAME} \
    —password=${PASSWORD} \
    —port=${PORT} \
    --safe-path=${SAFE_PATH} \
    -y \
    $(if [ "${SSL_DISABLE}" = 'yes' ]; then echo '--ssl-disable'; fi)
