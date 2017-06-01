<?php include ('partials/menu.php'); ?>
<?php $controller = new Controller(); ?>

				<div class="col-lg-9">
                        <h2>Nossos Funcionários</h2>
                        <div class="table-responsive">
                            <table class="table table-bordered table-hover table-striped">
                                <thead>
                                    <tr>
                                        <th>Nome</th>
                                        <th>Sobrenomne</th>
                                        <th>CPF</th>
                                        <th>RG</th>
                                        <th>Setor</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php
                                        foreach ($controller->getEmployees() as $key => $value) {
                                            echo "<tr>";
                                            echo "<td>{$value['nome']}</td>";
                                            echo "<td>{$value['sobre']}</td>";
                                            echo "<td>{$value['cpf']}</td>";
                                            echo "<td>{$value['rg']}</td>";
                                            echo "<td>{$value['setor']}</td>";
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

