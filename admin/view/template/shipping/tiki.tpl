<?php echo $header; ?>
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <?php if ($error_warning) { ?>
  <div class="warning"><?php echo $error_warning; ?></div>
  <?php } ?>
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/logotiki.png" alt="Jasa Pengiriman TIKI untuk Opencart by Bestariweb Studio" style="margin-top:-5px;"/> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a onclick="$('#form').submit();" class="button"><span><?php echo $button_save; ?></span></a><a onclick="location = '<?php echo $cancel; ?>';" class="button"><span><?php echo $button_cancel; ?></span></a></div>
    </div>
    <div class="content">
      <div style="background:url(view/image/logobestariweb.png) 100% 80% no-repeat; border-bottom:1px solid #ddf;width:100%;height:60px;margin:10px 0 20px 0;"></div>
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
        <table class="form">
          <tr>
            <td><?php echo $entry_cost; ?></td>
            <td><textarea name="tiki_cost" cols="40" rows="5"><?php echo $tiki_cost; ?></textarea></td>
          </tr>
          <tr>
            <td><?php echo $entry_tax; ?></td>
            <td><select name="tiki_tax_class_id">
                <option value="0"><?php echo $text_none; ?></option>
                <?php foreach ($tax_classes as $tax_class) { ?>
                <?php if ($tax_class['tax_class_id'] == $tiki_tax_class_id) { ?>
                <option value="<?php echo $tax_class['tax_class_id']; ?>" selected="selected"><?php echo $tax_class['title']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $tax_class['tax_class_id']; ?>"><?php echo $tax_class['title']; ?></option>
                <?php } ?>
                <?php } ?>
              </select></td>
          </tr>
          <tr>
            <td><?php echo $entry_geo_zone; ?></td>
            <td><select name="tiki_geo_zone_id">
                <option value="0"><?php echo $text_all_zones; ?></option>
                <?php foreach ($geo_zones as $geo_zone) { ?>
                <?php if ($geo_zone['geo_zone_id'] == $tiki_geo_zone_id) { ?>
                <option value="<?php echo $geo_zone['geo_zone_id']; ?>" selected="selected"><?php echo $geo_zone['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $geo_zone['geo_zone_id']; ?>"><?php echo $geo_zone['name']; ?></option>
                <?php } ?>
                <?php } ?>
              </select></td>
          </tr>
          <tr>
            <td><?php echo $entry_status; ?></td>
            <td><select name="tiki_status">
                <?php if ($tiki_status) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select></td>
          </tr>
          <tr>
            <td><?php echo $entry_sort_order; ?></td>
            <td><input type="text" name="tiki_sort_order" value="<?php echo $tiki_sort_order; ?>" size="1" /></td>
          </tr>
		      <tr>
            <td>Dibuat oleh </td>
            <td><a href="http://www.bestariweb.com">Bestariweb Studio</a> | Web Desain - Domain - Webhosting</td>
          </tr>
        </table>
      </form>
      <table class="form">
      <tr>
            <td>Donasi Pengembangan Plugin</td>
            <td>Apabila Anda merasa terbantu dengan Modul kami, silahkan donasikan sebagian uang Anda melalui Paypal atau kartu kredit Anda dengan meng-klik tombol <b>donate</b> di bawah ini. Sekecil Apapun donasi Anda, akan sangat berarti bagi pengembangan Plugin dan modul selanjutnya. Tunggu Theme dan Plugin kami berikutnya di <a href="http://www.bestari.web.id">http://www.bestari.web.id</a><br /><br />
              <form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_top">
              <input type="hidden" name="cmd" value="_s-xclick">
              <input type="hidden" name="hosted_button_id" value="4GLSEFFQXC87Q">
              <input type="image" src="https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif" border="0" name="submit" alt="PayPal - The safer, easier way to pay online!">
              <img alt="" border="0" src="https://www.paypalobjects.com/en_US/i/scr/pixel.gif" width="1" height="1">
              </form></td>
      </tr>
    </table>
    </div>
  </div>
</div>
<?php echo $footer; ?> 