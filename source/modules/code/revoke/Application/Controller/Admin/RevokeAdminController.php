<?php

namespace code\revoke\Application\Controller\Admin;

use OxidEsales\Eshop\Application\Controller\Admin\AdminController;
use OxidEsales\Eshop\Core\DatabaseProvider;
use OxidEsales\Eshop\Core\Registry;

class RevokeAdminController extends AdminController
{
    protected $_sThisTemplate = '@coderevoke/admin/revokeadmin.html.twig';
	
    protected array $_fields = ['Bestellung' => 'article', 'Bestellt am / Erhalten am' => 'ordered', 'Bestellnummer / Rechnungsnummer' => 'ordernr', 'Name' => 'name', 'E-Mail' => 'email', 'Adresse' => 'address', 'Anmerkungen' => 'message'];
    protected array $_multifields = ['article', 'address', 'message'];

    public function render()
    {
        parent::render();	
				
        $db = DatabaseProvider::getDb();
		$db->setFetchMode(\OxidEsales\Eshop\Core\DatabaseProvider::FETCH_MODE_ASSOC);
        $result = $db->select('SELECT * FROM code_revoke ORDER BY OXINSERT DESC');

        $revokes = [];
        while (!$result->EOF) {
            $revokes[] = $result->fields;
            $result->fetchRow();
        }

        $this->_aViewData['revokes'] = $revokes;
        return $this->_sThisTemplate;
    }
	
	public function deleteRevoke()
	{
		$oxid = Registry::getRequest()->getRequestParameter('oxid');
		if ($oxid) {
			$db = DatabaseProvider::getDb();
			$db->execute("DELETE FROM code_revoke WHERE OXID = ?", [$oxid]);
		}
	}
	
	public function changeRevoke()
	{
		$oxid = Registry::getRequest()->getRequestParameter('oxid');
		if ($oxid) {
			$db = DatabaseProvider::getDb();
			$db->execute("UPDATE code_revoke SET CODE_ACTIVE = 1 - CODE_ACTIVE  WHERE OXID = ?", [$oxid]);
		}
	}
	
	
	
	public function printRevoke()
	{
		$oxid = Registry::getRequest()->getRequestParameter('oxid');
		if (!$oxid) {
			return;
		}

		$db = \OxidEsales\Eshop\Core\DatabaseProvider::getDb();
		$db->setFetchMode(\OxidEsales\Eshop\Core\DatabaseProvider::FETCH_MODE_ASSOC);
		$record = $db->getRow("SELECT * FROM code_revoke WHERE OXID = ?", [$oxid]);
		if (!$record) {
			return;
		}

		// FPDF is bundled with the module and lives outside the public shop path.
		require_once dirname(__DIR__, 3) . '/lib/fpdf/fpdf.php';

		$pdf = new \FPDF();
		$pdf->AddPage();
		$pdf->SetFont('Arial', '', 12);

		$pdf->Cell(0, 10, 'Online-Widerruf', 0, 1, 'C');
		$pdf->Ln(10);
			$pdf->Cell(80, 10, 'vom:');
			$pdf->Cell(0, 10, $record['OXINSERT'], 0, 1);
		
		
		foreach ($this->_fields as $key => $field) {
			$pdf->Cell(80, 10, $key.':');
			$fieldName = strtoupper('code_'.$field);
			$lineHeight = (in_array ($field, $this->_multifields)) ? 6 : 10;
			$pdf->MultiCell(0, $lineHeight, $record[$fieldName], 0, 'L');
			if (in_array ($field, $this->_multifields)) {
				$pdf->Ln(4);
			}

		}	

		$pdf->Output('widerruf_' . $oxid . '.pdf', 'I'); // direkt im Browser anzeigen
		exit;
	}	
}
