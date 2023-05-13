import { ResultSnacksDto } from "./ResultSnacksDto";

export class BuySnacksResultDto {
    id: Number = 0;
    ticketId: String = "";
    quantity: Number = 0;
    snacks: ResultSnacksDto[] = [];
  }