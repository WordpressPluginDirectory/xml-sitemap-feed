<?php
/**
 * All in One SEO compatibility
 *
 * @package XML Sitemap & Google News
 */

namespace XMLSF\Compat;

/**
 * Class
 */
class AIOSEO {
	/**
	 * Admin notices.
	 */
	public static function admin_notices() {
		if ( ! \current_user_can( 'manage_options' ) || \in_array( 'aioseop_sitemap', (array) \get_user_meta( \get_current_user_id(), 'xmlsf_dismissed' ), true ) ) {
			return;
		}

		// check aioseop sitemap module.
		$aioseop = \json_decode( \get_option( 'aioseo_options', '' ) );

		if ( is_object( $aioseop ) && true === $aioseop->sitemap->general->enable ) {
			// sitemap module on.
			?>
			<div class="notice notice-warning fade is-dismissible">
				<p>
					<?php
					printf( /* translators: Conflicting Plugn name, Plugin name */
						\esc_html__( 'The %1$s XML Sitemap is not compatible with %2$s.', 'xml-sitemap-feed' ),
						\esc_html__( 'All in One SEO Pack', 'all-in-one-seo-pack' ),
						\esc_html__( 'XML Sitemap & Google News', 'xml-sitemap-feed' )
					);
					?>
					<?php
					printf( /* translators: Sitemap page name (linked to SEOPress plugin settings), XML Sitemap Index, Reading Settings admin page (linked to Reading settings) */
						\esc_html__( 'Please either disable the XML Sitemap under %1$s in your SEO settings or disable the option %2$s on %3$s.', 'xml-sitemap-feed' ),
						'<a href="' . esc_url( \admin_url( 'admin.php' ) ) . '?page=all-in-one-seo-pack%2Fmodules%2Faioseop_feature_manager.php">' . \esc_html__( 'Feature Manager', 'all-in-one-seo-pack' ) . '</a>',
						\esc_html__( 'XML Sitemap Index', 'xml-sitemap-feed' ),
						'<a href="' . esc_url( \admin_url( 'options-reading.php' ) ) . '#xmlsf_sitemaps">' . \esc_html( \translate( 'Reading Settings' ) ) . '</a>'
					);
					?>
				</p>
				<form action="" method="post">
					<?php \wp_nonce_field( XMLSF_BASENAME . '-notice', '_xmlsf_notice_nonce' ); ?>
					<p>
						<input type="hidden" name="xmlsf-dismiss" value="aioseop_sitemap" />
						<input type="submit" class="button button-small" name="xmlsf-dismiss-submit" value="<?php echo \esc_html( \translate( 'Dismiss' ) ); ?>" />
					</p>
				</form>
			</div>
			<?php
		}
	}
}
