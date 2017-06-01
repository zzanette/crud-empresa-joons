<?php include ('partials/menu.php'); ?>
<?php $controller = new Controller(); ?>

                <div class="col-lg-9">
                        <h2>Nossos Clientes</h2>
                        <div class="table-responsive">
                            <table class="table table-bordered table-hover table-striped">
                                <thead>
                                    <tr>
                                        <th>Nome</th>
                                        <th>Sobrenomne</th>
                                        <th>CPF</th>
                                        <th>RG</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php
                                        foreach ($controller->getClients() as $key => $value) {
                                            echo "<tr>";
                                            echo "<td>{$value['nome']}</td>";
                                            echo "<td>{$value['sobrenome']}</td>";
                                            echo "<td>{$value['CPF']}</td>";
                                            echo "<td>{$value['RG']}</td>";
                                            echo "</tr>";
                                        }
                                    ?>                   
 
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <!-- /.row -->          

<?php include ('partials/footer.php'); ?>

