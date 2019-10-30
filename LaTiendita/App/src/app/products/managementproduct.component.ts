import { Component, OnInit } from "@angular/core";
import { Product } from 'src/model/Product';
import { CommonService } from '../services/common.service';
import { Router, ActivatedRoute } from '@angular/router';

@Component({
    selector: 'app-managementproduct',
    templateUrl: './managementproduct.component.html',
    styleUrls: ['./managementproduct.component.css']
})
export class ManagementProductComponent implements OnInit {

    products: Product[] = [];

    constructor(private commonService: CommonService, private router: Router, private route: ActivatedRoute){
    }

    ngOnInit(): void {
        this.getProducts();
    }

    getProducts(){
        this.commonService.getAll('/product/GetProducts')
        .subscribe(
            result =>{
                this.products = result;
            },
            error => {
                console.log(error);
            }
        );
    }

    onDelete(product: Product){
        this.commonService.delete(product.ProductId, '/product/DeleteProduct')
        .subscribe(
            result => {
                alert('The product was deleted correctly');
                this.getProducts();
            },
            error => {
                console.log(error);
            }
        );
    }

    OnEdit(product: Product){
        this.router.navigate(['/product', {id: product.ProductId}], {relativeTo: this.route} )
    }

}