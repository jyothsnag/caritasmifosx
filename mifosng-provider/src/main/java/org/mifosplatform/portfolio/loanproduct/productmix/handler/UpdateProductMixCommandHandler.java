/**
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this file,
 * You can obtain one at http://mozilla.org/MPL/2.0/.
 */
package org.mifosplatform.portfolio.loanproduct.productmix.handler;

import org.mifosplatform.commands.handler.NewCommandSourceHandler;
import org.mifosplatform.infrastructure.core.api.JsonCommand;
import org.mifosplatform.infrastructure.core.data.CommandProcessingResult;
import org.mifosplatform.portfolio.loanproduct.productmix.service.ProductMixWritePlatformService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class UpdateProductMixCommandHandler implements NewCommandSourceHandler {

    private final ProductMixWritePlatformService productMixWritePlatformService;

    @Autowired
    public UpdateProductMixCommandHandler(final ProductMixWritePlatformService productMixWritePlatformService) {

        this.productMixWritePlatformService = productMixWritePlatformService;
    }

    @Transactional
    @Override
    public CommandProcessingResult processCommand(final JsonCommand command) {

        return this.productMixWritePlatformService.updateProductMix(command.getProductId(), command);
    }

}
