<?php
define( 'WP_CACHE', true );
// ** MySQL settings - You can get this info from your web host ** //
define( 'DB_NAME', 'sinau_lms_sd' );
define( 'DB_USER', 'root' );
define( 'DB_PASSWORD', 'alqowiyyu' );
define( 'DB_HOST', 'localhost' );
define( 'DB_CHARSET', 'utf8mb4' );
define( 'DB_COLLATE', '' );

define( 'AUTH_KEY',         '&$J)w`[XH$s9r]oj-vKS#g#|UF9-vfS#1aS9$M%Io77jD~ZQoh_><$.ivdY[]9MM' );
define( 'SECURE_AUTH_KEY',  'Zgf1.Wv5wf(6CG3`iUP]BqDZFN<D86ka+sBoCdVr:q]66zjQ2Im4id_8r8|vX)s$' );
define( 'LOGGED_IN_KEY',    '|z&dF;D8b{MM8y<%m+YmeO(}|[`U$sl++.83gk6VbPz1&f^X9G8H`[ZN40JYr(IH' );
define( 'NONCE_KEY',        '8@^q<RHQII9@Z>|.U?:x=C_<!a:S@=!IAIXXEO,O>Y}][|f]5)k[_2m-s<>D|l)+' );
define( 'AUTH_SALT',        'XpT|*~tz6cV~E0 .-vZy?Sa*F.]BhExr`q:5o]ui,$FfA8XI_X:EFRjNR[GEcQ$k' );
define( 'SECURE_AUTH_SALT', 'WQKCz5$85GGGF%$fZ)FV.qS`H2.sKp9N#G$|G,:$@f)6M?V,<l{Ng]nU5X$wzw2I' );
define( 'LOGGED_IN_SALT',   'TLWIO[8eDB<RZ,zNgI_N%scKu<c%9k?Xwlb9a~R/)}>AALCwgWEve6bLBuHvsI]}' );
define( 'NONCE_SALT',       ';TO`ID(M%?]Fgz%$h^]NM2]$yquS3TC:inCFHmvbcIGj:D!z)nZDV]tYg-:ePt]H' );

$table_prefix = 'sd_';
define( 'WP_DEBUG', false );
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}
require_once ABSPATH . 'wp-settings.php';