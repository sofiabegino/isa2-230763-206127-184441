import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { IDropdownSettings } from 'ng-multiselect-dropdown';
import { ToastrService } from 'ngx-toastr';
import { SnackService } from '../../services/snack.service';
import { UpdateSnacksDto } from '../../models/Snacks/UpdateSnacksDto';

@Component({
  templateUrl: './snack-form.component.html'
})
export class SnackUpdateComponent implements OnInit {

  mode: String = "Actualizar";
  model: UpdateSnacksDto = new UpdateSnacksDto()
  dropdownSettings: IDropdownSettings = {};

  constructor(private service: SnackService, private toastr: ToastrService, private router: Router, private activatedRoute: ActivatedRoute) { }

  ngOnInit(): void {
    this.CargarConfiguracion();
    this.CargarActualizar();
  }

  CargarConfiguracion(): void {
    this.dropdownSettings = {
      idField: 'key',
      textField: 'name',
      enableCheckAll: false,
    };
  }

  CargarActualizar(): void {
    this.activatedRoute.params.subscribe(params => {
      this.service.GetById(params["id"]).subscribe(snack => {
        this.model.description = snack.description
        this.model.price = snack.price
      })
    })
  }

  Confirmar() {
    this.service.Update(this.model).subscribe(res => {
      this.toastr.success("Snack actualizada correctamente", "Éxito")
      this.router.navigate(["/snacks"])
    },
      err => {
        this.toastr.error(err.error, "Error")
      })
  }
}
