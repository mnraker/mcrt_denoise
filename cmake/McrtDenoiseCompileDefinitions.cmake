# Copyright 2023-2024 DreamWorks Animation LLC
# SPDX-License-Identifier: Apache-2.0

function(McrtDenoise_cxx_compile_definitions target)
    target_compile_definitions(${target}
        PRIVATE
            TSLOG_SHOW_FILE                         # TODO: add comment

            $<$<CONFIG:DEBUG>:
                DEBUG                               # Enables extra validation/debugging code

                # Definitions for printing debug info
                TSLOG_LEVEL=TSLOG_MSG_DEBUG
                TSLOG_SHOW_PID
                TSLOG_SHOW_TID
                TSLOG_SHOW_TIME
            >
            $<$<CONFIG:RELWITHDEBINFO>:
                BOOST_DISABLE_ASSERTS               # Disable BOOST_ASSERT macro
            >
            $<$<CONFIG:RELEASE>:
                BOOST_DISABLE_ASSERTS               # Disable BOOST_ASSERT macro
            >

        PUBLIC
            ${GLOBAL_COMPILE_DEFINITIONS}
            GL_GLEXT_PROTOTYPES=1                   # This define makes function symbols to be available as extern declarations.
            TBB_SUPPRESS_DEPRECATED_MESSAGES        # Suppress 'deprecated' messages from TBB
    )
endfunction()

