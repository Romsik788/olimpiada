import { Controller, Get } from "@nestjs/common";

@Controller('dishes')
export class DishesController {
  @Get()
  findAll(): string[] {
    return ['id', 'name', 'image', 'description', 'price'];
  }
}