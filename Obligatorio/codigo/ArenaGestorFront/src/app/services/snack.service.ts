import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { environment } from 'src/environments/environment';
import { Observable } from 'rxjs';
import { ResultSnacksDto } from '../models/Snacks/ResultSnacksDto';
import { InsertSnacksDto } from '../models/Snacks/InsertSnacksDto';
import { UpdateSnacksDto } from '../models/Snacks/UpdateSnacksDto';
import { BuySnacksDto } from '../models/Snacks/BuySnacksDto';
import { BuySnacksResultDto } from '../models/Snacks/BuySnacksResultDto';

@Injectable({
  providedIn: 'root'
})
export class SnackService {

  private apiUrl: string
  private shopping: string

  constructor(private http: HttpClient) {
    this.shopping = environment.apiURL + "ticketSnacks"
    this.apiUrl = environment.apiURL + "snacks"
  }

  Get(): Observable<Array<ResultSnacksDto>> {
    let url = this.apiUrl
    return this.http.get<Array<ResultSnacksDto>>(url)
  }

  GetById(id: Number): Observable<ResultSnacksDto> {
    return this.http.get<ResultSnacksDto>(this.apiUrl + "/" + id.toString())
  }

  Insert(snack: InsertSnacksDto): Observable<ResultSnacksDto> {
    return this.http.post<ResultSnacksDto>(this.apiUrl, snack)
  }

  Update(snack: UpdateSnacksDto): Observable<ResultSnacksDto> {
    return this.http.put<ResultSnacksDto>(this.apiUrl, snack)
  }

  Delete(id: Number) {
    return this.http.delete(this.apiUrl + "/" + id.toString())
  }

  Shopping(ticket: BuySnacksDto): Observable<BuySnacksResultDto> {
    return this.http.post<BuySnacksResultDto>(this.shopping, ticket)
  }

}
