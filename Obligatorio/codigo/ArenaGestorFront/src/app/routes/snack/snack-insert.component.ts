import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { IDropdownSettings } from 'ng-multiselect-dropdown';
import { ToastrService } from 'ngx-toastr';
import { InsertSnacksDto } from 'src/app/models/Snacks/InsertSnacksDto';
import { SnackService } from '../../services/snack.service';

@Component({
  templateUrl: './snack-form.component.html'
})
export class SnackInsertComponent implements OnInit {

  mode: String = "Insertar";
  model: InsertSnacksDto = new InsertSnacksDto();

  dropdownSettings: IDropdownSettings = {};

  constructor(private service: SnackService, private toastr: ToastrService, private router: Router) { }

  ngOnInit(): void {
    this.CargarConfiguracion();
  }

  CargarConfiguracion(): void {
    this.dropdownSettings = {
      idField: 'key',
      textField: 'name',
      enableCheckAll: false,
    };
  }

  Confirmar() {
    this.service.Insert(this.model).subscribe(res => {
      this.toastr.success("Snack agregada correctamente", "Éxito");
      this.router.navigate(["/snacks"]);
    },
      err => {
        this.toastr.error(err.error, "Error");
      });
  }
}
