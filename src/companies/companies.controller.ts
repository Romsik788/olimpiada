import { Controller, Get } from "@nestjs/common";

@Controller('companies')
export class CompaniesController {
  @Get()
  findAll(): string[] {
    return ['id', 'name', 'description'];
  }
}