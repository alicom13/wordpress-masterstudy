<?php

if (!defined('ABSPATH')) exit; //Exit if accessed directly


function stm_lms_wp_head()
{
    ?>
    <script type="text/javascript">
        var stm_lms_ajaxurl = '<?php echo esc_url(admin_url('admin-ajax.php')); ?>';
        var stm_lms_resturl = '<?php echo rest_url('stm-lms/v1', 'json'); ?>';
    </script>

    <style>
        .vue_is_disabled {
            display: none;
        }
    </style>
    <?php
}

add_action('wp_head', 'stm_lms_wp_head');
add_action('admin_head', 'stm_lms_wp_head');


function stm_lms_enqueue_ss()
{
    $v = (WP_DEBUG) ? time() : STM_LMS_DB_VERSION;
    $assets = STM_LMS_URL . 'assets';
    $base = STM_LMS_URL . 'nuxy/metaboxes/assets/';

    wp_enqueue_style('linear', $assets . '/linearicons/linear.css', array(), $v);
    wp_enqueue_style('linear-icons', $base . 'css/linear-icons.css', NULL, $v);
    wp_enqueue_style('font-awesome-min', $assets . '/vendors/font-awesome.min.css', NULL, $v, 'all');
    wp_enqueue_style('ms-font-icomoon', $assets . '/vendors/icomoon.fonts.css', NULL, $v, 'all');
    wp_enqueue_style('stm_lms_icons', $assets . '/icons/style.css', NULL, $v);
    wp_enqueue_style('video.js', $assets . '/vendors/video-js.min.css', NULL, $v, 'all');
    wp_register_style('owl.carousel', $assets . '/vendors/owl.carousel.min.css', NULL, $v, 'all');

    wp_enqueue_script('jquery');

    if (STM_LMS_Helpers::is_stripe_enabled()) wp_enqueue_script('stripe.js', 'https://js.stripe.com/v3/', array(), false, false);

    $vue = (!WP_DEBUG) ? '.min' : '.min';
    wp_register_script('vue.js', $base . "js/vue{$vue}.js", array('jquery'), $v, false);
    wp_register_script('vue-resource.js', $base . 'js/vue-resource.min.js', array('vue.js'), $v, false);
    wp_register_script('vue2-editor.js', $base . 'js/vue2-editor.min.js', array('vue.js'), $v);
    wp_enqueue_script('vue.js');
    wp_enqueue_script('vue-resource.js');
    $r_enabled = STM_LMS_Helpers::g_recaptcha_enabled();
    if ($r_enabled):
        $recaptcha = STM_LMS_Helpers::g_recaptcha_keys();

        wp_register_script(
            'stm_grecaptcha',
            'https://www.google.com/recaptcha/api.js?T=1&render=' . $recaptcha['public'], array('jquery'),
            $v,
            true
        );
    endif;

    wp_register_script('jquery.cookie', $assets . '/vendors/jquery.cookie.js', array('jquery'), $v, TRUE);
    wp_register_script('resize-sensor', $assets . '/vendors/ResizeSensor.js', array('jquery'), $v, TRUE);
    wp_register_script('sticky-sidebar', $assets . '/vendors/sticky-sidebar.min.js', array('jquery'), $v, TRUE);
    wp_register_script('video.js', $assets . '/vendors/video.min.js', array(), $v, TRUE);
    wp_register_script('owl.carousel', $assets . '/vendors/owl.carousel.js', array('jquery'), $v, TRUE);
    if (apply_filters('stm_lms_enqueue_bootstrap', true)) {
        wp_enqueue_script('bootstrap', $assets . '/vendors/bootstrap.min.js', array('jquery'), $v, TRUE);
    }
    wp_enqueue_script('vue2-datepicker', $base . 'js/vue2-datepicker.min.js', array('vue.js'), $v);
    wp_enqueue_script('lms_countdown.js', $assets . '/js/countdown.js', array('jquery'), $v, TRUE);
    wp_register_script('jquery.countdown', $assets . '/vendors/jquery.countdown.js', array('jquery'), $v, TRUE);

    if (stm_lms_has_custom_colors()) {
        wp_enqueue_style('masterstudy-lms-learning-management-system', stm_lms_custom_styles_url(true) . '/stm_lms.css', array(), stm_lms_custom_styles_v());
    } else {
        wp_enqueue_style('masterstudy-lms-learning-management-system', $assets . '/css/stm_lms.css', array(), time());
    }
    
    if (is_rtl()) {
        wp_enqueue_style('masterstudy-lms-learning-management-system-rtl-styles', $assets . '/css/rtl-styles.css', array(), time());
    }

    if (is_user_logged_in()) {
        stm_lms_register_script('become_instructor');
        stm_lms_register_style('become_instructor');
    }

    if (current_user_can('edit_posts')) {
        wp_enqueue_style('stm_lms_logged_in', $assets . '/css/stm_lms_logged_in.css', NULL, $v, 'all');
    }


    stm_lms_register_script('lms');
    wp_localize_script('stm-lms-lms', 'stm_lms_vars', array(
        'symbol' => STM_LMS_Options::get_option('currency_symbol', '$'),
        'position' => STM_LMS_Options::get_option('currency_position', 'left'),
        'currency_thousands' => STM_LMS_Options::get_option('currency_thousands', ','),
        'wp_rest_nonce' => wp_create_nonce('wp_rest')
    ));

    if (STM_LMS_Subscriptions::subscription_enabled()) stm_lms_register_style('pmpro');

    /*Enqueue not MasterStudy theme related styles*/
    if (!stm_lms_is_masterstudy_theme()) {
        stm_lms_register_style('noconflict/main');
        stm_lms_register_script('noconflict/main', array('jquery'));
    }

}

function stm_lms_enqueue_vss() {
    $v = (WP_DEBUG) ? time() : STM_LMS_DB_VERSION;
    $assets = STM_LMS_URL . 'assets';
    $base = STM_LMS_URL . 'nuxy/metaboxes/assets/';

    if (apply_filters('stm_lms_enqueue_bootstrap', true)) {
        wp_enqueue_style('bootstrap', $assets . '/vendors/bootstrap.min.css', NULL, $v, 'all');
    }
};

add_action('wp_enqueue_scripts', 'stm_lms_enqueue_ss');
add_action('wp_enqueue_scripts', 'stm_lms_enqueue_vss', 1);

add_action('admin_head', 'stm_lms_nonces');
add_action('wp_head', 'stm_lms_nonces');

function stm_lms_nonces()
{

    $nonces = array(
        'load_modal',
        'load_content',
        'start_quiz',
        'user_answers',
        'get_order_info',
        'user_orders',
        'stm_lms_get_instructor_courses',
        'stm_lms_add_comment',
        'stm_lms_get_comments',
        'stm_lms_login',
        'stm_lms_register',
        'stm_lms_become_instructor',
        'stm_lms_enterprise',
        'stm_lms_get_user_courses',
        'stm_lms_get_user_quizzes',
        'stm_lms_wishlist',
        'stm_lms_save_user_info',
        'stm_lms_lost_password',
        'stm_lms_change_avatar',
        'stm_lms_delete_avatar',
        'stm_lms_complete_lesson',
        'stm_lms_use_membership',
        'stm_lms_change_featured',
        'stm_lms_delete_course_subscription',
        'stm_lms_get_reviews',
        'stm_lms_add_review',
        'stm_lms_add_to_cart',
        'stm_lms_delete_from_cart',
        'stm_lms_purchase',
        'stm_lms_send_message',
        'stm_lms_get_user_conversations',
        'stm_lms_get_user_messages',
        'stm_curriculum',
        'stm_manage_posts',
        'stm_curriculum_create_item',
        'stm_curriculum_get_item',
        'stm_save_questions',
        'stm_save_title',
        'wpcfto_save_settings',
        'stm_lms_tables_update',
        'stm_lms_get_enterprise_groups',
        'stm_lms_get_enterprise_group',
        'stm_lms_add_enterprise_group',
        'stm_lms_delete_enterprise_group',
        'stm_lms_add_to_cart_enterprise',
        'stm_lms_get_user_ent_courses',
        'stm_lms_delete_user_ent_courses',
        'stm_lms_add_user_ent_courses',
        'stm_lms_change_ent_group_admin',
        'stm_lms_delete_user_from_group',
        'stm_lms_import_groups',
        'stm_lms_upload_file_assignment',
        'stm_lms_delete_assignment_file',
        'stm_lms_save_draft_content',
        'stm_lms_accept_draft_assignment',
        'stm_lms_get_assignment_data',
        'stm_lms_get_instructor_assingments',
        'stm_lms_get_user_assingments',
        'stm_lms_edit_user_answer',
        'stm_lms_get_user_points_history',
        'stm_lms_buy_for_points',
        'stm_lms_get_point_users',
        'stm_lms_get_user_points_history_admin',
        'stm_lms_change_points',
        'stm_lms_delete_points',
        'stm_lms_get_user_bundles',
        'stm_lms_change_bundle_status',
        'stm_lms_delete_bundle',
        'stm_lms_get_co_courses',
        'stm_lms_check_certificate_code',
        'stm_lms_get_google_classroom_courses',
        'stm_lms_get_google_classroom_course',
        'stm_lms_get_google_classroom_publish_course',
        'stm_lms_get_g_c_get_archive_page',
        'install_zoom_addon',
        'stm_lms_get_course_cookie_redirect',
        'stm_get_certificates',
        'stm_get_certificate_fields',
        'stm_save_certificate',
        'stm_get_certificate_categories',
        'stm_get_certificate',
        'stm_delete_certificate',
        'stm_lms_get_users_submissions',
        'stm_lms_update_user_status',
        'stm_lms_hide_become_instructor_notice',
        'stm_lms_ban_user',
        'stm_lms_save_forms',
        'stm_lms_get_forms',
        'stm_lms_upload_form_file',
        'stm_lms_dashboard_get_course_students',
        'stm_lms_dashboard_delete_user_from_course',
        'stm_lms_dashboard_add_user_to_course',
        'stm_lms_add_to_cart_guest',
        'stm_lms_fast_login',
        'stm_lms_fast_register',
        'stm_lms_change_lms_author',
        'stm_lms_add_student_manually',
        'stm_lms_change_course_status',
        'stm_lms_total_progress',
        'stm_lms_add_h5p_result',
        'stm_lms_toggle_buying',
        'stm_lms_logout',
        'stm_lms_restore_password',
        'stm_lms_hide_announcement',
        'stm_lms_get_curriculum_v2',
        'stm_lms_dashboard_get_student_progress',
        'stm_lms_dashboard_set_student_item_progress',
        'stm_lms_dashboard_reset_student_progress',
        'stm_lms_dashboard_get_courses_list',
        'stm_lms_dashboard_get_student_assignments',
        'stm_lms_dashboard_get_student_quizzes',
        'stm_lms_dashboard_get_student_quiz',
        'stm_lms_wizard_save_settings',
        'stm_lms_wizard_save_business_type',
        'stm_lms_get_enrolled_assingments',
    );

    $nonces_list = array();

    foreach ($nonces as $nonce_name) {
        $nonces_list[$nonce_name] = wp_create_nonce($nonce_name);
    }

    ?>
    <script>
        var stm_lms_nonces = <?php echo json_encode($nonces_list); ?>;
    </script>
    <?php
}