import { Injectable } from '@nestjs/common';

@Injectable()
export class AppService {
  getHello(): string[] {
    return ['api/dishes', 'api/categories', 'api/companies'];
  }
}
