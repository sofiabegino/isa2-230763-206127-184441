import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import { SnackService } from '../../services/snack.service';
import { ResultSnacksDto } from '../../models/Snacks/ResultSnacksDto';

@Component({
  templateUrl: './snack.component.html',
})
export class SnackComponent implements OnInit {

  snackList: Array<ResultSnacksDto> = new Array()
  snackToDelete: Number = 0;
  filter: String = "";

  constructor(private toastr: ToastrService, private service: SnackService, private router: Router) { }

  ngOnInit(): void {
    this.GetData()
  }

  GetData() {
    this.service.Get().subscribe(res => {
      this.snackList = res
    })
  }

  SetSnackToDelete(id: Number) {
    this.snackToDelete = id;
  }

  Delete() {
    this.service.Delete(this.snackToDelete).subscribe(res => {
      this.toastr.success("Se ha eliminado el snack", "Éxito")
      this.GetData();
    },
      err => {
        console.log(err)
        this.toastr.error(err.error, "Error")
      })
  }

}
