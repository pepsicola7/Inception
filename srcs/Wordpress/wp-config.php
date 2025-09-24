define('WP_HOME',    'https://peli.42.fr');
define('WP_SITEURL', 'https://peli.42.fr');

/* If you ever sit behind a proxy/load balancer, keep this too: */
if (isset($_SERVER['HTTP_X_FORWARDED_PROTO']) && $_SERVER['HTTP_X_FORWARDED_PROTO'] === 'https') {
    $_SERVER['HTTPS'] = 'on';
}
