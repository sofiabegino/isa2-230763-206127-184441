import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import { TicketBuyTicketDto } from 'src/app/models/Tickets/TicketBuyTicketDto';
import { ConcertService } from 'src/app/services/concert.service';
import { TicketsService } from 'src/app/services/tickets.service';
import { SnackService } from '../../services/snack.service';
import { BuySnacksDto } from '../../models/Snacks/BuySnacksDto';

@Component({
  selector: 'app-buy',
  templateUrl: './buy.component.html'
})
export class BuyComponent implements OnInit {

  selectedTourName: String = "";
  selectedId: Number = 0;
  selectedSnackDescription: String = "";
  selectedSnackId: Number = 0;
  amount : Number = 0;
  amountSnacks : Number = 0;

  constructor(private toastr: ToastrService, private ticketService: TicketsService, private service: ConcertService, private snackService: SnackService, private router: Router, private activatedRoute: ActivatedRoute) { }

  ngOnInit(): void {
    this.activatedRoute.params.subscribe(params => {
      this.service.GetById(params["id"]).subscribe(concert => { 
        this.selectedTourName = concert.tourName
        this.selectedId = concert.concertId
      })
    })

    this.activatedRoute.params.subscribe(params => {
      this.snackService.GetById(params["id"]).subscribe(snack => { 
        this.selectedSnackId = snack.snackId
      })
    })
  }

  Confirmar() {
    let ticketsDto = new TicketBuyTicketDto()
    ticketsDto.Amount = this.amount
    ticketsDto.concertId = this.selectedId
    this.ticketService.Shopping(ticketsDto).subscribe(res => {
      this.toastr.success("Ticket comprado con ID: " + res.ticketId)
      this.ComprarSnacks(res.ticketId);
    }, error => {
      this.toastr.error(error.error)
    })
  }

  ComprarSnacks(ticketId: String) {
    let snacksDto = new BuySnacksDto()
    snacksDto.ticketId = ticketId
    snacksDto.snackId = this.selectedSnackId
    snacksDto.quantity = this.amountSnacks
    this.snackService.Shopping(snacksDto).subscribe(res => {
      this.toastr.success("Snack comprado con ID: " + res.id)
    }, error => {
      this.toastr.error(error.error)
    })
  }
}
