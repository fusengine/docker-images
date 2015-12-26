# env composer
VERSION_COMPOSER=${COMPOSER_VERSION}
TOKEN_GITHUB=${GITHUB_TOKEN}

# Update and install php7-cli
echo ""
echo "                    Update ubuntu & install php7-cli "
echo ""
apt-get update && apt-get install php7.0-cli -y

# Install Composer
echo " "
echo  "                   Install composer :  $VERSION_COMPOSER  "
echo "                   Add github token : $TOKEN_GITHUB  "
echo ""
curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer --version=$VERSION_COMPOSER
composer config --global github-oauth.github.com $TOKEN_GITHUB

# Install symfony
echo ""
echo "                     Install Symfony installer "
echo ""
curl -LsS https://symfony.com/installer -o /usr/local/bin/symfony && \
    chmod a+x /usr/local/bin/symfony && \
    symfony self-update

# Upgrade and dist-upgrade
echo ""
echo "                     Update and dist-upgrade "
echo ""
apt-get dist-upgrade -y && apt-get upgrade -y

# Cleanup
echo ""
echo "                     Cleanup "
echo ""
rm -r /var/lib/apt/lists/
apt-get clean

# create data
echo ""
echo "                     Create data "
echo ""
mkdir /data

echo ""
echo "                     Complete "
echo ""
