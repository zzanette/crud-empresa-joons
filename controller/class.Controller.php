<?php


class Controller {

     
    public function redirect($location) {
        header('Location: '.$location);
    }
     
    public function handleRequest() {
        $op = isset($_GET['op'])?$_GET['op']:NULL;

        try {
            if ( !$op || $op == 'dashboard' ) {
               $this->showDashboard();
            } elseif ( $op == 'funcionario' ) {
               $this->showFuncionario();
            } elseif ( $op == 'atendimento' ) {
               $this->showAtendimento();
            } elseif ( $op == 'pedido' ) {
               $this->showPedido();
            } elseif ( $op == 'cliente' ) {
               $this->showCliente();
            } else {
               //$this->showError("Page not found", "Page for operation ".$op." was not found!");
                echo "Erro";
            }
        } catch ( Exception $e ) {
            // some unknown Exception got through here, use application error page to display it
            $this->showError("Application error", $e->getMessage());
        }
    }
     
 	public function showDashboard() {
        include 'view/pages/dashboard.php';
    }

    public function showFuncionario() {
        include 'view/pages/funcionario.php';
    }

    public function showAtendimento() {
        include 'view/pages/atendimento.php';
    }

    public function showPedido() {
        include 'view/pages/pedido.php';
    }

    public function showCliente() {
        include 'view/pages/cliente.php';
    }

    public function getEmployees(){
        $model = new Model();
        return $model->getEmployees();
    }

    public function getClients(){
        $model = new Model();
        return $model->getClients();
    }

    public function getTotal($table, $col){
        $model = new Model();
        return $model->getTotal($table, $col);
    }

    public function getCount($table){
        $model = new Model();
        return $model->getCount($table);
    }



}