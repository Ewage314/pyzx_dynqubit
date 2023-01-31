OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[6], q[9];
cx q[7], q[0];
cx q[6], q[1];
cx q[2], q[9];
