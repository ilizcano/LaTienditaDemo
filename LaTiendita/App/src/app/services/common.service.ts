import { Injectable } from '@angular/core';
import { environment } from 'src/environments/environment';
import { Product } from 'src/model/Product';
import { Observable } from 'rxjs';
import { HttpClient } from '@angular/common/http';

@Injectable()
export class CommonService {

    urlServer = environment.urlServer;

    constructor(private http: HttpClient) {
    }

    save(model: any, urlMethod: string): Observable<any> {
        return this.http.post<any>(this.urlServer + urlMethod, model);
    }

    delete(id: number, urlMethod: string): Observable<any> {
        return this.http.delete(this.urlServer + urlMethod + '/' + id);
    }

    getAll(urlMethod: string) {
        return this.http.get<any[]>(urlMethod);
    }

    getEntityById(id: number, urlMethod): Observable<any> {
       return this.http.get<any>(this.urlServer + urlMethod+ '/' + id);
    }

}