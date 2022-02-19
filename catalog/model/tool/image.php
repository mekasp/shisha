<?php

class ModelToolImage extends Model {

    /**
     *
     * 	@param filename string
     * 	@param width
     * 	@param height
     * 	@param type char [default, w, h]
     * 				default = scale with white space,
     * 				w = fill according to width,
     * 				h = fill according to height
     *
     */

    public function onesize($filename, $maxsize) {

        if (!file_exists(DIR_IMAGE . $filename) || !is_file(DIR_IMAGE . $filename)) {
            return;
        }

        $info = pathinfo($filename);
        $extension = $info['extension'];

        $old_image = $filename;
        $new_image = 'cache/' . substr($filename, 0, strrpos($filename, '.')) . '-max-' . $maxsize . '.' . $extension;

        if (!file_exists(DIR_IMAGE . $new_image) || (filemtime(DIR_IMAGE . $old_image) > filemtime(DIR_IMAGE . $new_image))) {
            $path = '';

            $directories = explode('/', dirname(str_replace('../', '', $new_image)));

            foreach ($directories as $directory) {
                $path = $path . '/' . $directory;

                if (!file_exists(DIR_IMAGE . $path)) {
                    @mkdir(DIR_IMAGE . $path, 0777);
                }
            }

            $image = new Image(DIR_IMAGE . $old_image);
            $image->onesize($maxsize);
            $image->save(DIR_IMAGE . $new_image);
        }

        if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
            return $this->config->get('config_ssl') . 'image/' . $new_image;
        } else {
            return $this->config->get('config_url') . 'image/' . $new_image;
        }

    }

    public function resize($filename, $width = 0, $height = 0, $type = "") {
        if (!file_exists(DIR_IMAGE . $filename) || !is_file(DIR_IMAGE . $filename)) {
            return;
        }

        $info = pathinfo($filename);

        $extension = $info['extension'];

        $filebasesize = getimagesize(DIR_IMAGE . $filename);

        if ($filebasesize) {
            if ($width == 0 && $height) {
                $coef = ($height / $filebasesize[1]);

                $width = $filebasesize[0] * $coef;
            }

            if ($height == 0 && $width) {
                $coef = ($width / $filebasesize[0]);

                $height = $filebasesize[1] * $coef;
            }
        }

        $old_image = $filename;
        $new_image = 'cache/' . utf8_substr($filename, 0, utf8_strrpos($filename, '.')) . '-' . $width . 'x' . $height . $type . '.' . $extension;

        if (!file_exists(DIR_IMAGE . $new_image) || (filemtime(DIR_IMAGE . $old_image) > filemtime(DIR_IMAGE . $new_image))) {
            $path = '';

            $directories = explode('/', dirname(str_replace('../', '', $new_image)));

            foreach ($directories as $directory) {
                $path = $path . '/' . $directory;

                if (!file_exists(DIR_IMAGE . $path)) {
                    @mkdir(DIR_IMAGE . $path, 0777);
                }
            }

            list($width_orig, $height_orig) = getimagesize(DIR_IMAGE . $old_image);

            if ($width_orig != $width || $height_orig != $height) {
                $image = new Image(DIR_IMAGE . $old_image);
                $image->resize($width, $height, $type);
                $image->save(DIR_IMAGE . $new_image);
            } else {
                copy(DIR_IMAGE . $old_image, DIR_IMAGE . $new_image);
            }
        }

        return $this->getImageUrl($new_image);
    }

    protected function getImageUrl($new_image) {
        $parts = explode('/', $new_image);
        $new_url = implode('/', array_map('rawurlencode', $parts));
        if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
            return $this->config->get('config_ssl') . 'image/' . $new_url;
        } else {
            return $this->config->get('config_url') . 'image/' . $new_url;
        }
    }

}
