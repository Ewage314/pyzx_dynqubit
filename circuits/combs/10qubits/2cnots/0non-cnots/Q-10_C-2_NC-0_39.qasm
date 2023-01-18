OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[5], q[2];
cx q[0], q[7];
