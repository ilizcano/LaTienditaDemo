
import { Component, OnInit } from "@angular/core";
import { FormGroup, FormControl, Validators } from '@angular/forms';
import { Product } from 'src/model/Product';
import { CommonService } from '../services/common.service';
import { Router, ActivatedRoute } from '@angular/router';

@Component({
    selector: 'app-product',
    templateUrl: './product.component.html',
    styleUrls: ['./product.component.css']
})
export class ProductComponent implements OnInit {

    productFormGroup: FormGroup;
    idProduct: number = 0;

    constructor(private commonService: CommonService, private router: Router, private route: ActivatedRoute) {
    }

    ngOnInit(): void {
        this.productFormGroup = new FormGroup({
            nameControl: new FormControl('', [Validators.required]),
            priceControl: new FormControl('', [Validators.required]),
            descriptionControl: new FormControl()
        });

        this.route.params.subscribe(params => {
            this.idProduct = params['id'] !== undefined ? +params['id'] : 0;
            this.getProduct(this.idProduct)
        });
    }

    onSaveProduct() {
        const product = this.getValueForm();
        this.commonService.save(product, '/product/SaveProduct')
            .subscribe(
                result => {
                    alert('The product was added correctly');
                    this.productFormGroup.reset();
                    this.goToProductsPage();
                },
                error => {
                }
            )
    }

    getValueForm() {
        const obj = new Product();
        obj.ProductId = this.idProduct == 0 ? 0 : this.idProduct;
        obj.Name = this.productFormGroup.controls['nameControl'].value.trim();
        obj.Price = this.productFormGroup.controls['priceControl'].value.trim();
        obj.Description = this.productFormGroup.controls['descriptionControl'].value.trim();

        return obj;
    }

    goToProductsPage() {
        this.router.navigate(['/managementproduct']);
    }

    getProduct(id: number) {
        this.commonService.getEntityById(id, '/product/GetProductById')
            .subscribe(
                result => {
                    this.setValues(result);
                },
                error => {
                    console.log(error)
                }
            )
    }

    setValues(productToEdit: Product) {
        this.productFormGroup.controls['nameControl'].setValue(productToEdit.Name);
        this.productFormGroup.controls['priceControl'].setValue(productToEdit.Price);
        this.productFormGroup.controls['descriptionControl'].setValue(productToEdit.Description);
    }

}