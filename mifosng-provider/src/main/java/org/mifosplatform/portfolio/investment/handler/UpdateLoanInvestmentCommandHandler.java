package org.mifosplatform.portfolio.investment.handler;

import org.mifosplatform.commands.handler.NewCommandSourceHandler;
import org.mifosplatform.infrastructure.core.api.JsonCommand;
import org.mifosplatform.infrastructure.core.data.CommandProcessingResult;
import org.mifosplatform.portfolio.investment.service.InvestmentWritePlatformService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
@Service
public class UpdateLoanInvestmentCommandHandler implements NewCommandSourceHandler {
	private final InvestmentWritePlatformService investmentWritePlatformService;

    @Autowired
    public UpdateLoanInvestmentCommandHandler(final InvestmentWritePlatformService investmentWritePlatformService) {
    	  super();
    	this.investmentWritePlatformService = investmentWritePlatformService;
    }

    @Transactional
    @Override
    public CommandProcessingResult processCommand(final JsonCommand command) {

        return this.investmentWritePlatformService.updateLoanInvestment(command.getLoanId(),command);
    }

}
