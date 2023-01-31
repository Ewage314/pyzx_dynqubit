OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[7], q[1];
cx q[1], q[8];
cx q[6], q[7];
cx q[8], q[3];
