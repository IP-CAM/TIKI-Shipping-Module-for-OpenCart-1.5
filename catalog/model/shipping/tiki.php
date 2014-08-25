<?php
class ModelShippingtiki extends Model {
	function getQuote($address) {
		$this->load->language('shipping/tiki');
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "zone_to_geo_zone WHERE geo_zone_id = '" . (int)$this->config->get('tiki_geo_zone_id') . "' AND country_id = '" . (int)$address['country_id'] . "' AND (zone_id = '" . (int)$address['zone_id'] . "' OR zone_id = '0')");
	
		if (!$this->config->get('tiki_geo_zone_id')) {
			$status = true;
		} elseif ($query->num_rows) {
			$status = true;
		} else {
			$status = false;
		}

		$method_data = array();
	
		if ($status) {
		
		$tiki_cost = 0;
			$weight = $this->cart->getWeight();
			
			$rates = preg_split('/\r\n/', $this->config->get('tiki_cost'));
			
			foreach ($rates as $rate) {
				$items = explode(',', $rate);
				if ($address['zone_id'] == $items[0]) {
					$pos = strpos(strtolower($items[1]), strtolower($address['city']));
					if ($pos !== false) {
						$format_tarif_tiki = number_format($weight, 2, '.', ',');
						$tarif_tanpa_koma = substr($format_tarif_tiki, 0, -2);
						$tarif_desimal = $weight - $tarif_tanpa_koma;
						if ($weight <= 1.0){
							$tiki_cost = $items[2];
						}elseif($tarif_desimal < 0.1){
							$tiki_cost = $tarif_tanpa_koma*$items[2];
						}else{
							$tiki_cost = ($tarif_tanpa_koma+1)* $items[2];
						}
                                           
						break;
					}                                       
					}
			}
			
		
		
			$quote_data = array();
			if($tiki_cost == 0){ // kontrol
      		$quote_data['tiki'] = array(
        		'id'           => 'tiki.tiki',
        		'title'        => $this->language->get('text_shipping_not_available'),
        		'cost'         => $tiki_cost,
        		'tax_class_id' => $this->config->get('tiki_tax_class_id'),
				'text'         => $this->language->get('text_cost_zero')
      		);

      		$method_data = array(
        		'id'         => 'tiki',
        		'title'      => $this->language->get('text_title'),
        		'quote'      => $quote_data,
				'sort_order' => $this->config->get('tiki_sort_order'),
        		'error'      => FALSE
      		);
			}else{ // kontrol
      		$quote_data['tiki'] = array(
        		'code'           => 'tiki.tiki',
        		'title'        => $this->language->get('text_description'),
        		'cost'         => $tiki_cost,
        		'tax_class_id' => $this->config->get('tiki_tax_class_id'),
				'text'         => $this->currency->format($this->tax->calculate($tiki_cost, $this->config->get('tiki_tax_class_id'), $this->config->get('config_tax')))
      		);

      		$method_data = array(
        		'code'         => 'tiki',
        		'title'      => $this->language->get('text_title'),
        		'quote'      => $quote_data,
				'sort_order' => $this->config->get('tiki_sort_order'),
        		'error'      => FALSE
      		);
			} // kontrol
			
					}
					
	
		return $method_data;
	}
}
?>