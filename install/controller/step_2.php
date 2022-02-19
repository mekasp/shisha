<?php
class ControllerStep2 extends Controller {
	private $error = array();
	
	public function index() {
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && ($this->validate())) {
			$this->redirect(HTTP_SERVER . 'index.php?route=step_3');
		}

		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';	
		}
		
		$this->data['action'] = HTTP_SERVER . 'index.php?route=step_2';

		$this->data['config_catalog'] = DIR_OPENCART . 'config.php';
		$this->data['config_admin'] = DIR_OPENCART . 'admin/config.php';
		
		$this->data['cache'] = DIR_SYSTEM . 'cache';
		$this->data['logs'] = DIR_SYSTEM . 'logs';
		$this->data['image'] = DIR_OPENCART . 'image';
		$this->data['image_cache'] = DIR_OPENCART . 'image/cache';
		$this->data['image_data'] = DIR_OPENCART . 'image/data';
		$this->data['download'] = DIR_OPENCART . 'download';
		
		$this->template = 'step_2.tpl';

		$this->children = array(
			'header',
			'footer'
		);		
		
		$this->response->setOutput($this->render());
	}
	
	private function validate() {
		if (phpversion() < '5.0') {
			$this->error['warning'] = 'Предупреждение: Вы должны использовать версию PHP5 или выше для установки OpenCart!';
		}

		if (!ini_get('file_uploads')) {
			$this->error['warning'] = 'Предупреждение: file_uploads должно быть включено!';
		}
	
		if (ini_get('session.auto_start')) {
			$this->error['warning'] = 'Предупреждение: OpenCart не будет работать с session.auto_start настройкой!';
		}
		
		if (!extension_loaded('mysql')) {
			$this->error['warning'] = 'Предупреждение: MySQL расширение должно быть установлено!';
		}
				
		if (!extension_loaded('gd')) {
			$this->error['warning'] = 'Предупреждение: GD расширение должно быть установлено!';
		}

		if (!extension_loaded('curl')) {
			$this->error['warning'] = 'Предупреждение: CURL расширение должно быть установлено!';
		}

		if (!function_exists('mcrypt_encrypt')) {
			$this->error['warning'] = 'Предупреждение: mCrypt расширение должно быть установлено!';
		}
				
		if (!extension_loaded('zlib')) {
			$this->error['warning'] = 'Предупреждение: ZLIB расширение должно быть установлено!';
		}
	
		if (!is_writable(DIR_OPENCART . 'config.php')) {
			$this->error['warning'] = 'Предупреждение: config.php должен иметь права на запись!';
		}
				
		if (!is_writable(DIR_OPENCART . 'admin/config.php')) {
			$this->error['warning'] = 'Предупреждение: admin/config.php должен иметь права на запись!';
		}

		if (!is_writable(DIR_SYSTEM . 'cache')) {
			$this->error['warning'] = 'Предупреждение: Cache каталог должен иметь права на запись!';
		}
		
		if (!is_writable(DIR_SYSTEM . 'logs')) {
			$this->error['warning'] = 'Предупреждение: Logs каталог должен иметь права на запись!';
		}
		
		if (!is_writable(DIR_OPENCART . 'image')) {
			$this->error['warning'] = 'Предупреждение: Image каталог должен иметь права на запись!';
		}

		if (!is_writable(DIR_OPENCART . 'image/cache')) {
			$this->error['warning'] = 'Предупреждение: Image каталог должен иметь права на запись!';
		}
		
		if (!is_writable(DIR_OPENCART . 'image/data')) {
			$this->error['warning'] = 'Предупреждение: Image каталог должен иметь права на запись!';
		}
		
		if (!is_writable(DIR_OPENCART . 'download')) {
			$this->error['warning'] = 'Предупреждение: Download каталог должен иметь права на запись!';
		}
		
    	if (!$this->error) {
      		return true;
    	} else {
      		return false;
    	}
	}
}
?>