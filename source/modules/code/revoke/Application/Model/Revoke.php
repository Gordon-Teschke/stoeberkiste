<?php

namespace code\revoke\Application\Model;

use OxidEsales\Eshop\Core\Model\BaseModel;

class Revoke extends BaseModel
{
    protected $_sCoreTable = 'code_revoke';

    public function __construct()
    {
        parent::__construct();
        $this->init($this->_sCoreTable);
    }
}
